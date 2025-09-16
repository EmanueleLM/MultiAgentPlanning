(define (domain betty-meet-two-agents)
  (:requirements :typing :durative-actions :numeric-fluent)
  (:types agent location)

  ; Two agents in the world
  (:constants you betty Richmond Financial - agent location)

  ; Predicates
  (:predicates
     (at ?a - agent ?l - location)
     (met)
  )

  ; Global time (minutes from midnight)
  (:functions (time))

  ; Travel actions for You
  (:durative-action travel-you-to-financial
     :duration 22
     :condition (at start (at you Richmond))
     :effects (and
                (at end (not (at you Richmond)))
                (at end (at you Financial))
                (increase (time) 22))
  )

  (:durative-action travel-you-to-richmond
     :duration 21
     :condition (at start (at you Financial))
     :effects (and
                (at end (not (at you Financial)))
                (at end (at you Richmond))
                (increase (time) 21))
  )

  ; Travel actions for Betty (kept distinct)
  (:durative-action travel-betty-to-financial
     :duration 22
     :condition (at start (at betty Richmond))
     :effects (and
                (at end (not (at betty Richmond)))
                (at end (at betty Financial))
                (increase (time) 22))
  )

  (:durative-action travel-betty-to-richmond
     :duration 21
     :condition (at start (at betty Financial))
     :effects (and
                (at end (not (at betty Financial)))
                (at end (at betty Richmond))
                (increase (time) 21))
  )

  ; Waiting actions to advance time at a given agent's location
  (:durative-action wait-you
     :parameters (?l - location)
     :duration 15
     :condition (at start (at you ?l))
     :effects (increase (time) 15)
  )

  (:durative-action wait-betty
     :parameters (?l - location)
     :duration 15
     :condition (at start (at betty ?l))
     :effects (increase (time) 15)
  )

  ; Meet Betty for 60 minutes
  ; Preconditions:
  ; - You are at Financial
  ; - Betty is at Financial
  ; - Start time is within Betty's window: 17:15 (1035) to 21:45 (1245)
  (:durative-action meet-betty
     :duration 60
     :condition (and
                  (at start (at you Financial))
                  (at start (at betty Financial))
                  (at start (>= (time) 1035))
                  (at start (<= (time) 1245)))
     :effects (and
               (at end (met))
               (increase (time) 60))
  )
)