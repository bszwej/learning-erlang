# Chapter 5: Records and Maps

## 5.1 When to use maps or records
- tuple vs list
    - tuples are for fixed number of elements
    - lists are for varying number of elements
- Maps are like
    - maps in erlang, c++, java
    - tables in lua
    - dictionaries in python
- Records are tuples in disguise - they have similar performance and storage characteristics
- Use records if:
    - you represent data as fixed number of atoms
    - number of elements won't change over time
- Use maps if:
    - keys are not known in advance
    - performance is not important, but convenience of use
    - trees or configuration files, jsons etc.

## 5.2 Naming Tuple Items with Records
- Record declarations does not work in shell

```
2> rr("records.hrl").
[todo]
3> #todo{}.
#todo{status = reminder,who = bartek,text = undefined}
15> X1#todo{who=other}.
#todo{status = very_urgent,who = other,text = "Do it!"}
16> #todo{who=AA, text=Txt} = X2.
#todo{status = very_urgent,who = joe,text = "Do it!"}
17> AA.
joe
18> Txt.
"Do it!"
21> X2#todo.text.
"Do it!"
```

## TODO

- [ ] Exercise 1. (reading and parsing json config) using jsx or jiffy 
