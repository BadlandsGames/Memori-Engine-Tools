getKeyByValue = (obj, value) ->
    for key of obj
        if obj[key] == value
        return key
    undefined

class Operators
    @common_math -> return
        "add": "+"
        "subtract": "-"
        "multiply": "*"
        "divide": "/"
        "modulus": "%"
        "inc": "++"
        "dec": "--"
    @binary -> return
        "and": "&&"
        "or": "||"
        "xor": "^"
        "not": "!"
        "nand": "!&&"
        "nor": "!||"
        "xnor": "^!||"