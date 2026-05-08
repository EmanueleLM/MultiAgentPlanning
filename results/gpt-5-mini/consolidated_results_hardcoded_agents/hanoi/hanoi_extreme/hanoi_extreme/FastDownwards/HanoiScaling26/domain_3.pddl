(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)    ; disk is directly on a place (disk or peg)
    (clear ?p - place)           ; place (disk or peg) has no disk on top of it
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is smaller than ?d2
    (current ?s - stage)         ; current global stage token
    (succ ?s1 - stage ?s2 - stage) ; successor relation between stages
  )

  ;; Move a clear disk that is directly on some place onto a clear disk (must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s1))
      (current ?s2)
    )
  )

  ;; Move a clear disk that is directly on some place onto a clear peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s1))
      (current ?s2)
    )
  )
)