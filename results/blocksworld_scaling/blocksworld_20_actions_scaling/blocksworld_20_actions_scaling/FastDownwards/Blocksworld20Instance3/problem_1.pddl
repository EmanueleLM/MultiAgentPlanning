(define (problem blocksworld20instance3-problem)
  (:domain blocksworld20instance3)
  (:objects a b c d e f g h i)
  (:init
    ;; initial on relations
    (on a d)
    (on d e)
    (on e c)
    (on b f)
    (on f i)
    (on i h)

    ;; initial ontable facts
    (ontable c)
    (ontable g)
    (ontable h)

    ;; initial clear facts (top blocks)
    (clear a)
    (clear b)
    (clear g)

    ;; initial hand state
    (handempty)
  )
  (:goal (and
    ;; final arrangement as derived
    (on a g)
    (on g f)
    (on f i)
    (on i h)
    (on d e)
    (on e c)
    (ontable c)
    (ontable h)
    (ontable b)
    ;; require the hand to be empty at the end
    (handempty)
  ))
)