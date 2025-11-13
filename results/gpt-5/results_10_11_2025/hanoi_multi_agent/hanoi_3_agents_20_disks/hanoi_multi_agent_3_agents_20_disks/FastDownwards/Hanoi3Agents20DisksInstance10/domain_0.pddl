(define (domain hanoi_multiagent_20)
  (:requirements :strips :typing)
  (:types
    disk peg
  )
  (:predicates
    (on ?x - disk ?y - object)
    (onpeg ?x - disk ?p - peg)
    (clear ?x - object)
    (top ?p - peg ?x - object)
    (smaller ?x - disk ?y - object)
    (disk ?x - disk)
    (peg ?p - peg)
  )

  (:action move
    :parameters (?x - disk ?p - peg ?q - peg ?s - object ?y - object)
    :precondition (and
      (disk ?x)
      (peg ?p)
      (peg ?q)
      (top ?p ?x)
      (on ?x ?s)
      (top ?q ?y)
      (clear ?x)
      (clear ?y)
      (smaller ?x ?y)
    )
    :effect (and
      ; move x from support s on peg p to support y on peg q
      (not (on ?x ?s))
      (on ?x ?y)

      ; source updates
      (not (top ?p ?x))
      (top ?p ?s)
      (clear ?s)

      ; destination updates
      (not (top ?q ?y))
      (top ?q ?x)
      (not (clear ?y))
      (clear ?x)
    )
  )
)