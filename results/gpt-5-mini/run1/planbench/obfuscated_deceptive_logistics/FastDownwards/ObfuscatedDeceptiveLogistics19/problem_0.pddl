(define (problem ordering-problem)
  (:domain ordering)
  (:objects
    object_11 object_9 - object
  )
  (:init
    ;; Canonicalized initial facts: no successor/predecessor facts are present,
    ;; so objects are free to be linked by set-next.
  )
  (:goal (and
    (next object_11 object_9)
  ))
)