
```pddl
(define (domain day_schedule)
  (:requirements :strips :typing)
  (:types location activity)
  (:predicates 
    (at ?loc - location)
    (task_done ?act - activity)
    (connected ?from ?to - location)
  )
  
  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at ?from) (connected ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )
  
  (:action do_task
    :parameters (?act - activity ?loc - location)
    :precondition (and (at ?loc) (not (task_done ?act)))
    :effect (task_done ?act)
  )
)
```
