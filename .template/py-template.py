def func_foo():
    return 1
 



test_size = [5]
'''
test_2D_mat = [[[1,1,1,1,1],
                [1,1,1,0,0],
                [1,1,1,0,0],
                [1,1,1,0,0],
                [1,1,1,1,1]]]
'''
test_vec = [[1,2,3]]

test_results = [3]
test_count = len(test_results)


def run_test():
    for i in range(test_count):
        result = func_foo()
        print(f'result: {result} -- {True if result == test_results[i] else False}')
        print('--------------------')


def main():
    run_test()

if __name__ == '__main__':
    main()
