
```pddl
(define (problem schedule_day)
  (:domain day_schedule)
  (:objects 
    home office park restaurant - location
    lunch meeting leisure - activity
  )
  (:init 
    (at home)
    (connected home office)
    (connected office park)
    (connected park restaurant)
    (connected restaurant home)
  )
  (:goal 
    (and 
      (task_done lunch)
      (task_done meeting)
      (task_done leisure)
    )
  )
)
```
