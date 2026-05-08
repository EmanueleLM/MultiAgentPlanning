(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place stage
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (next ?s1 - stage ?s2 - stage)
    (stage-ready ?s - stage)
  )

  (:action mover-move-to-peg
    :parameters (?disk - disk ?from - place ?peg - peg ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?peg)
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (= ?from ?peg))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?peg)
      (not (clear ?peg))
      (clear ?from)
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  (:action mover-move-to-disk
    :parameters (?disk - disk ?from - place ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?target)
      (smaller ?disk ?target)
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (= ?from ?target))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?target)
      (not (clear ?target))
      (clear ?from)
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)