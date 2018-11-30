# Michael Trinh
# CS 4080-02
# Programming Assignment 1

# methods
def factor(x,y) 
    y % x == 0
end

def prime(x)
    for i in 2..x-1
        if (x % i == 0) 
            return false 
        end
    end
    if(x <= 1)
        false
    else
        true
    end 
end

def gcd(x, y)
    if (y == 0) 
        x
    else 
        gcd(y, x % y)
    end
end

def perfectSum(x)
    sum = 0
    for i in 1..x-1
        if (x % i == 0) 
            sum += i
        end
    end
    sum
end

def perfect(x)
    perfectSum(x) == x
end

def amicable(x, y)
    (perfectSum(x) == y) and (perfectSum(y) == x)
end

def occr(nums, x)
    total = 0
    for i in 0..nums.length-1
        if(nums[i] == x)
            total += 1
        end 
    end
    total
end

def primes(nums)
    primeArray = Array[]
    for i in 0..nums.length-1
        if(prime(nums[i]))
            primeArray.push(nums[i])
        end
    end
    primeArray
end

def primeFactors(x)
    primeFactorArray = Array[]
    for i in 2..x-1
        if(prime(i) and factor(i, x))
            primeFactorArray.push(i)
        end
    end
    primeFactorArray
end

# global variables
x = 24
y = 6
nums = Array[1, 2, 3, 4, 5, 1, 2, 3, 3, 1, 21, 81, -23, 3]
# test methods here
print("Factor of ", y," is ", x, ": ", factor(x,y), "\n")
print(x, " is a prime number: ", prime(x), "\n")
print("Greatest common divisor of ", x, " and ", y, ": ", gcd(x,y) , "\n")
print(x, " is a perfect number: ", perfect(x) , "\n")
print(x, " and ", y, " are amicable numbers: ", amicable(x, y) , "\n")
print("The number of times ", x, " appears in ", nums, " is ", 
    occr(nums, x), " times.\n")
print("The prime numbers in ", nums, " are ", primes(nums), ".\n")
print("The prime factors in ", x, " are ", primeFactors(x), ".\n")