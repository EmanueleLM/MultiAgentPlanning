(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time-slot)

  (:constants
     Brandon Jerry Bradley - person
     t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
     t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time-slot
  )

  (:predicates
     (free ?p - person ?t - time-slot)
     (scheduled ?t - time-slot)
  )

  (:action schedule_by_Brandon
     :parameters (?slot - time-slot)
     :precondition (and (free Brandon ?slot)
                        (free Jerry ?slot)
                        (free Bradley ?slot)
                        (not (scheduled ?slot)))
     :effect (and (not (free Brandon ?slot))
                  (not (free Jerry ?slot))
                  (not (free Bradley ?slot))
                  (scheduled ?slot))
  )

  (:action schedule_by_Jerry
     :parameters (?slot - time-slot)
     :precondition (and (free Brandon ?slot)
                        (free Jerry ?slot)
                        (free Bradley ?slot)
                        (not (scheduled ?slot)))
     :effect (and (not (free Brandon ?slot))
                  (not (free Jerry ?slot))
                  (not (free Bradley ?slot))
                  (scheduled ?slot))
  )

  (:action schedule_by_Bradley
     :parameters (?slot - time-slot)
     :precondition (and (free Brandon ?slot)
                        (free Jerry ?slot)
                        (free Bradley ?slot)
                        (not (scheduled ?slot)))
     :effect (and (not (free Brandon ?slot))
                  (not (free Jerry ?slot))
                  (not (free Bradley ?slot))
                  (scheduled ?slot))
  )
)