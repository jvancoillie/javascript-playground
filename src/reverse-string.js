/**
 * Reverse string with recursive function
 *
 * @param input
 * @returns {string}
 */
function reverseString(input){
    if(input ===''){
        return '';
    }

    return reverseString(input.substring(1)) + input.charAt(0);
}

console.log(reverseString("hello"));