(* 
    Michael Trinh 
    CS 4080-02
    Programming Assignment 1 
*)

fun factor(x, y) : bool = y mod x = 0; 

fun primeHelper(x, divisor) : bool = 
    if (x = divisor) then true
    else if (x mod divisor = 0) then false   
    else primeHelper(x, divisor + 1);

fun prime(x) : bool = 
    if(x <= 1) then false
    else primeHelper(x, 2); 

fun gcd(x, y) : int =
    if (y = 0) then x
    else gcd(y, x mod y);

fun perfectSum(x, divisor, sum) : int =
    if (x = divisor) then sum
    else if(x mod divisor = 0) then perfectSum(x, divisor + 1, sum + divisor)
    else perfectSum(x, divisor + 1, sum);

fun perfect(x) : bool = perfectSum(x, 1, 0) = x;

fun amicable(x, y) : bool = perfectSum(x, 1, 0) = y andalso perfectSum(y, 1, 0) = x;

fun occrHelper(nums, x : int, sum) : int =
    if(nums = []) then sum
    else if(hd(nums) = x) then occrHelper(tl(nums), x, sum+1)
    else occrHelper(tl(nums), x, sum);

fun occr(nums, x) : int = occrHelper(nums,x,0);

fun primesHelper(nums, primesList) : int list = 
    if(nums = []) then primesList
    else if(prime(hd(nums))) then primesHelper(tl(nums), hd(nums)::primesList)
    else primesHelper(tl(nums),primesList);
    
fun primes(nums) : int list = primesHelper(nums, []);

fun primeFactorsHelper(x, divisor, primeFactorsList) : int list =
    if(x = divisor) then primeFactorsList
    else if(prime(divisor) andalso factor(divisor, x)) 
        then primeFactorsHelper(x, divisor + 1, divisor::primeFactorsList)
    else  primeFactorsHelper(x, divisor + 1, primeFactorsList);

fun primeFactors(x) : int list = primeFactorsHelper(x, 2, []);

print("\n");

(* global variables *)
val x = 24;
val y = 4;
val nums = [1, 2, 3, 24, 7, 24, 213, 1, 32]; 

print("\n");

(* test methods here *)
val factorResult = factor(x,y);
val primeResult = prime(x);
val gcdResult = gcd(x,y);
val perfectResult = perfect(x);
val amicableResult = amicable(x, y);
val occrResult = occr(nums, x);
val primesResult = primes(nums);
val primeFactorsResult = primeFactors(x);