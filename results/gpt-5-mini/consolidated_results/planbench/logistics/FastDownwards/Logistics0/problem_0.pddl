(define (problem make-next-object_8-object_6)
  (:domain orchestrator-next-link)

  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )

  ; Initial state: no next links exist; thus no has-successor or has-predecessor facts.
  (:init
    ; explicitly no facts are listed here for next/has-successor/has-predecessor,
    ; which means all such predicates are false initially.
  )

  ; Goal: enforce that object_8's successor is object_6.
  (:goal (and
    (next object_8 object_6)
  ))
)