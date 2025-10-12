import multiprocessing, hashlib

try:
    from student_solution import solve as student_sol
except (ModuleNotFoundError, ImportError):
    student_sol = None

from OJ.model_solution import model as model_sol
from OJ.test_cases import subtasks

TIME_LIMIT = 4

def checksum(obj):
    if isinstance(obj, (frozenset, tuple)):
        obj = tuple(sorted(obj))
    h = hashlib.md5(str(obj).encode())
    return h.hexdigest()

def run_with_timeout(func, *args, timeout=TIME_LIMIT):
    def wrapper(q):
        try:
            res = func(*args)
            if res is None: raise NotImplementedError("function returned nothing")
            q.put(("OK", checksum(res)))
        except Exception as e:
            q.put(("Error", e))

    q = multiprocessing.Queue()
    p = multiprocessing.Process(target=wrapper, args=(q,))
    p.start(); p.join(timeout)

    if p.is_alive():
        p.terminate(); p.join()
        return "TLE", None
    return q.get() if not q.empty() else ("Error", None)

def run_tests():
    if student_sol is None:
        print("Student function not found.")
        return

    total_points = sum(s["points"] for s in subtasks.values())
    score = 0
    final_verdict = "Accepted"

    for sub_name, sub_data in subtasks.items():
        print(f"\n---{sub_name}--- ({sub_data['points']} pts)")
        verdict = "Accepted"

        for i, inp in enumerate(sub_data["cases"], 1):
            expected = checksum(model_sol(*inp))
            status, student = run_with_timeout(student_sol, *inp)

            if status == "TLE":
                msg, verdict = f"TLE (> {TIME_LIMIT}s)", "TLE"
            elif status == "Error":
                msg, verdict = f"Error ({student})", "Error"
            elif student != expected:
                msg, verdict = "WA", "WA"
            else:
                msg = "Accepted"

            print(f"Test case {i}: {msg}")
            if verdict != "Accepted":
                break

        print(f"Subtask Verdict: {verdict}")
        if verdict == "Accepted":
            score += sub_data["points"]
        else:
            final_verdict = verdict

    print(f"\nFinal Verdict: {final_verdict}")
    print(f"Score: {score}/{total_points}")

if __name__ == "__main__":
    run_tests()
