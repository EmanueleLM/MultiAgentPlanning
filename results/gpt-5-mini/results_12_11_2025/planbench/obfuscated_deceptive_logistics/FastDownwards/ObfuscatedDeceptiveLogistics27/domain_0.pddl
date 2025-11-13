(define (domain reassign-next)
  (:requirements :strips :typing)
  (:types obj step)

  (:predicates
    (hand ?h - obj)
    (next ?h - obj ?t - obj)          ; hand ?h's next link points to target ?t
    (texture ?o - obj)
    (spring ?o - obj)
    (at-step ?s - step)               ; global sequencing token: which step is currently active
    (step-successor ?s1 - step ?s2 - step)
    (allowed-step-hand ?s - step ?h - obj) ; which hand is authorized to act at a given step
  )

  ;; Generic move_next action that enforces the explicit plan ordering:
  ;; It reassigns a hand's next link from OLD to NEW, provided NEW has texture,
  ;; the hand currently points to OLD, and the global step token matches.
  (:action move_next
    :parameters (?h - obj ?old - obj ?new - obj ?s_from - step ?s_to - step)
    :precondition (and
      (hand ?h)
      (next ?h ?old)
      (texture ?new)
      (at-step ?s_from)
      (step-successor ?s_from ?s_to)
      (allowed-step-hand ?s_from ?h)
    )
    :effect (and
      (not (next ?h ?old))
      (next ?h ?new)
      (not (at-step ?s_from))
      (at-step ?s_to)
    )
  )
)