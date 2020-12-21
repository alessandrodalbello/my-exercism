import re

class SgfTree:
    def __init__(self, properties=None, children=None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other):
        if not isinstance(other, SgfTree):
            return False
        for k, v in self.properties.items():
            if k not in other.properties:
                return False
            if other.properties[k] != v:
                return False
        for k in other.properties.keys():
            if k not in self.properties:
                return False
        if len(self.children) != len(other.children):
            return False
        for a, b in zip(self.children, other.children):
            if a != b:
                return False
        return True

    def __ne__(self, other):
        return not self == other


def parse(input_string):
    sgfTree, input_string = __parse_node(input_string)
    if not sgfTree or input_string:
        raise ValueError("SGF not valid.")
    return sgfTree


def __parse_node(input_string):
    if not input_string or input_string[0] != "(":        
        return (None, input_string)
    
    node_level = 1
    escaped = False
    i = 1
    while i < len(input_string):
        if escaped:
            escaped = False
        else:
            c = input_string[i]
            if c == ")":
                node_level -= 1
                if node_level == 0:
                    break
            elif c == "(":
                node_level += 1
            elif c == "\\":
                escaped = True
        i += 1
    
    node_string = input_string[1:i]
    node = __parse_simple_node(node_string)[0]
    return (node, input_string[i+1:])


def __parse_simple_node(input_string):
    if not input_string or input_string[0] != ";":
        raise ValueError("SGF not valid.")
 
    escaped = False
    i = 1
    while i < len(input_string):
        if escaped:
            escaped = False
        else:
            c = input_string[i]
            if c == "(" or c == ")" or c == ";":
                break
            elif c == "\\":
                escaped = True
        i += 1

    properties_string = input_string[1:i]
    input_string = input_string[i:]
    properties = __parse_properties(properties_string)

    children = []
    while input_string:
        child, input_string = __parse_node(input_string)
        if not child:
            if not children:
                child, input_string = __parse_simple_node(input_string)
            else:
                raise ValueError("SGF not valid.")
        children.append(child)
    return (SgfTree(properties, children), input_string)


def __parse_properties(input_string):
    properties = {}
    while input_string:
        prop, input_string = __parse_property(input_string)
        properties = {**properties, **prop}
    return properties


def __parse_property(input_string):
    key, input_string = __parse_property_key(input_string)
    values, input_string = __parse_property_values(input_string)
    return ({ key : values }, input_string)


def __parse_property_key(input_string):
    i = 0
    while i < len(input_string):
        c = input_string[i]
        if c == "[":
            break
        elif c < "A" or c > "Z":
            raise ValueError("SGF not valid.")
        i += 1
    return (input_string[0:i], input_string[i:])


def __parse_property_values(input_string):
    values = []
    escaped = False
    in_property = False
    i = 0
    v = 0
    while i < len(input_string):
        if escaped:
            escaped = False
        else:
            c = input_string[i]
            if c == "[":
                v = i
                in_property = True
            elif c == "]":
                value = __parse_property_value(input_string[v+1:i])
                values.append(value)
                in_property = False
            elif c == "\\":
                escaped = True
            elif not in_property:
                break
        i += 1

    if not values:
        raise ValueError("SGF not valid.")
    return (values, input_string[i:])


def __parse_property_value(input_string):
    input_string = re.sub(r"\t|\\\n|\\\r", " ", input_string)
    return re.sub(r"\\(?!\\)", "", input_string)
