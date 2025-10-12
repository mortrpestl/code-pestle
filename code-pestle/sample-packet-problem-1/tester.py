import multiprocessing
import hashlib

try:
    from student_solution import solve as student_sol
except (ModuleNotFoundError, ImportError):
    student_sol = None

from OJ.model_solution import model as model_sol
from OJ.test_cases import subtasks

TIME_LIMIT = 4

def checksum(obj):
    if isinstance(obj, frozenset):
        obj = tuple(sorted(obj))
    elif isinstance(obj, tuple):
        obj = tuple(sorted(obj))  
    h = hashlib.md5()
    h.update(str(obj).encode())
    return h.hexdigest()

def wrapper(func, args, queue):
    try:
        result = func(*args)
        if result==None: raise NotImplementedError('function returns nothing or does not exist')
        queue.put(("OK", checksum(result)))
    except Exception as e:
        queue.put(("Error", e))

def run_with_timeout(func, *args, timeout=TIME_LIMIT):
    queue = multiprocessing.Queue()
    p = multiprocessing.Process(target=wrapper, args=(func, args, queue))
    p.start()
    p.join(timeout)

    if p.is_alive():
        p.terminate()
        p.join()
        return "TLE", None
    if queue.empty():
        return "Error", None

    return queue.get()

def run_tests():
    final_verdict = "Accepted"
    total_points = 0
    score = 0

    for subtask_name, subtask_data in subtasks.items():
        cases = subtask_data["cases"]
        points = subtask_data["points"]
        total_points += points

        print(f"\n---{subtask_name}--- for {points} points")
        subtask_verdict = "Accepted"

        for i, inp in enumerate(cases, 1):
            try:
                expected_checksum = checksum(model_sol(*inp))
            except:
                ...
                
            if student_sol is None:
                print(f"Test case {i}: Error (student function not found)")
                subtask_verdict = "Error"
                break

            status, student_checksum = run_with_timeout(student_sol, *inp, timeout=TIME_LIMIT)

            status, student_checksum = run_with_timeout(student_sol, *inp, timeout=TIME_LIMIT)
            
            if status == "TLE":
                print(f"Test case {i}: TLE (exceeded {TIME_LIMIT}s)")
                subtask_verdict = "TLE"
                break
            elif status == "Error":
                print(f"Test case {i}: Error ({student_checksum})")
                subtask_verdict = "Error"
                break
            elif student_checksum is None:
                print(f"Test case {i}: Error (function returned nothing)")
                subtask_verdict = "Error"
                break
            elif student_checksum == expected_checksum:
                print(f"Test case {i}: Accepted")
            else:
                print(f"Test case {i}: WA")
                subtask_verdict = "WA"
                break


        print(f"Subtask Verdict: {subtask_verdict}")
        if subtask_verdict == "Accepted":
            score += points
        else:
            final_verdict = subtask_verdict

    print(f"\nFinal Verdict: {final_verdict}")
    print(f"Score: {score}/{total_points}")

if __name__ == "__main__":
    run_tests()
