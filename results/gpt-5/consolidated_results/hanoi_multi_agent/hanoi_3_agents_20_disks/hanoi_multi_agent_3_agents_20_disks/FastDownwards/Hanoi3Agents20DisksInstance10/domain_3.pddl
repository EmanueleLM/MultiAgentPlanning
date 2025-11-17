(define (domain hanoi_multiagent_20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?x - disk ?y - disk)
    (onpeg ?x - disk ?p - peg)
    (clear ?x - disk)
    (clearpeg ?p - peg)
    (smaller ?x - disk ?y - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?x - disk ?p - peg ?q - peg)
    :precondition (and (onpeg ?x ?p) (clear ?x) (clearpeg ?q))
    :effect (and
      (not (onpeg ?x ?p))
      (onpeg ?x ?q)
      (clearpeg ?p)
      (not (clearpeg ?q))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?x - disk ?p - peg ?y - disk)
    :precondition (and (onpeg ?x ?p) (clear ?x) (clear ?y) (smaller ?x ?y))
    :effect (and
      (not (onpeg ?x ?p))
      (on ?x ?y)
      (clearpeg ?p)
      (not (clear ?y))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?x - disk ?y - disk ?q - peg)
    :precondition (and (on ?x ?y) (clear ?x) (clearpeg ?q))
    :effect (and
      (not (on ?x ?y))
      (onpeg ?x ?q)
      (clear ?y)
      (not (clearpeg ?q))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?x - disk ?y - disk ?z - disk)
    :precondition (and (on ?x ?y) (clear ?x) (clear ?z) (smaller ?x ?z))
    :effect (and
      (not (on ?x ?y))
      (on ?x ?z)
      (clear ?y)
      (not (clear ?z))
    )
  )
)