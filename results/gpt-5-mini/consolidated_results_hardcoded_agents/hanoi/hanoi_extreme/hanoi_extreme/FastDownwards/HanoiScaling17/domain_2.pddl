(define (domain hanoi-seven)
  (:requirements :strips :typing :negative-preconditions)

  (:types place stage)
  (:types disk - place)
  (:types peg - place)

  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)          ; place ?p (peg or disk) has nothing directly on it
    (smaller ?x - disk ?y - disk); size ordering: ?x is strictly smaller than ?y
    (current ?s - stage)         ; which stage is currently active
    (next ?s - stage ?s2 - stage); successor relation for stages
  )

  ;; Move a top disk from a place (?from) onto an empty peg (?to), advancing stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a place (?from) onto a smaller disk (?to), advancing stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)