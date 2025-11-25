(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)              ; disk ?d is directly on place ?p (peg or another disk)
    (clear ?p - place)                    ; place ?p has no disk on top of it (peg empty or disk top)
    (smaller ?d1 - disk ?d2 - disk)       ; d1 is strictly smaller than d2
    (next ?s1 - stage ?s2 - stage)        ; s2 is immediate successor of s1
    (at-stage ?s - stage)                 ; global stage token
    (different-place ?p1 - place ?p2 - place) ; helper: ordered distinct places
    (different-disk ?d1 - disk ?d2 - disk)    ; helper: ordered distinct disks
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg.
  (:action move-to-peg
    :parameters (?x - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (at-stage ?s)
      (next ?s ?s2)
      (different-place ?from ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from any place onto a top disk (destination disk must be strictly larger).
  (:action move-to-disk
    :parameters (?x - disk ?from - place ?y - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?y)
      (smaller ?x ?y)
      (at-stage ?s)
      (next ?s ?s2)
      (different-disk ?x ?y)
      (different-place ?from ?y)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)