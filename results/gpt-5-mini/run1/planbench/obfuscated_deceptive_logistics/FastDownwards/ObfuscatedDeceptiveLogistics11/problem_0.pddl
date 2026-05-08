(define (problem arrange-next-problem)
  (:domain arrange-next-domain)
  (:objects
     object_6 object_7 object_8 object_9 object_10 object_11 - object
  )
  (:init
    ; Both planners are available to perform their origin actions
    (available-plannera)
    (available-plannerb)
    ; No next relations, no successors / predecessors initially (explicitly absent)
  )
  ; Global goal: enforce the three required adjacency relations exactly
  (:goal (and
           (next object_10 object_8)
           (next object_11 object_7)
           (next object_9 object_6)
         )
  )
)