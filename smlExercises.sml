(* 
    Michael Trinh 
    CS 4080-02
    Programming Assignment 1 
*)
fun factor(x, y) : bool = y mod x = 0; 
 
val factorResult = factor(3,4);
val factorResult = factor(6,12);

fun primeHelper(x, divisor) : bool = 
    if (x = divisor) then true
    else if (x mod divisor = 0) then false   
    else primeHelper(x, divisor + 1);

fun prime(x) : bool = primeHelper(x, 2); 
    
val primeResult = prime(12);
val primeResult = prime(17);

fun gcd(x, y) : int =
    if (y = 0) then x
    else gcd(y, x mod y);

val gcdResult = gcd(12,24);
val gcdResult = gcd(30,20);
val gcdResult = gcd(5,2);

fun perfectSum(x, divisor, sum) : int =
    if (x = divisor) then sum
    else if(x mod divisor = 0) then perfectSum(x, divisor + 1, sum + divisor)
    else perfectSum(x, divisor + 1, sum);

fun perfect(x) : bool = perfectSum(x, 1, 0) = x;

val perfectResult = perfect(6);
val perfectResult = perfect(8);
val perfectResult = perfect(28);

fun amicable(x, y) : bool = perfectSum(x, 1, 0) = y andalso perfectSum(y, 1, 0) = x;

val amicableResult = amicable(220, 284);
val amicableResult = amicable(25, 31);
val amicableResult = amicable(12285, 14595);

fun occrHelper(nums, x : int, sum) : int =
    if(nums = []) then sum
    else if(hd(nums) = x) then occrHelper(tl(nums), x, sum+1)
    else occrHelper(tl(nums), x, sum);

fun occr(nums, x) : int = occrHelper(nums,x,0);

val Result = occr([1,2,3,1,7,123,213,1,32], 1);
val Result = occr([1,2,3,1,7,123,213,1,32], 23);

fun primesHelper(nums, primesList) : int list = 
    if(nums = []) then primesList
    else if(prime(hd(nums))) then primesHelper(tl(nums), hd(nums)::primesList)
    else primesHelper(tl(nums),primesList);
    
fun primes(nums) : int list = primesHelper(nums, []);

val primesResult = primes([2,3,12,17,21,23]);

fun primeFactorsHelper(x, divisor, primeFactorsList) : int list =
    if(x = divisor) then primeFactorsList
    else if(prime(divisor) andalso factor(divisor, x)) 
        then primeFactorsHelper(x, divisor + 1, divisor::primeFactorsList)
    else  primeFactorsHelper(x, divisor + 1, primeFactorsList);

fun primeFactors(x) : int list = primeFactorsHelper(x, 2, []);

val primeFactorsResult = primeFactors(18);
val primeFactorsResult = primeFactors(1238);