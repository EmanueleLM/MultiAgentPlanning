(define (problem mystery_blocksworld7)
  (:domain mystery_craving)
  ; Instance modeling notes:
  ; - harmony is global.
  ; - province, planet, pain are per-object predicates.
  ; - craves is a directed relation craves <from> <to>.
  (:objects a b c d - obj)

  (:init
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province c)
  )

  (:goal (and
    (craves a c)
    (craves b a)
    (craves d b)
  ))
)