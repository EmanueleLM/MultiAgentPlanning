(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
    stage
  )

  (:predicates
    (on ?d - disk ?p - place)         ;; immediate support: disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)               ;; nothing is on top of place ?p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)  ;; static strict size ordering: ?d1 is smaller than ?d2
    (succ ?s1 - stage ?s2 - stage)   ;; ordered successor relation between stages
    (current ?s - stage)             ;; unique current global stage token
  )

  ;; Move a top disk ?d from supporter ?from (peg or disk) to an empty peg ?to.
  ;; Advances stage token from ?s to its successor ?s2.
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)        ;; ?d is the top disk on its supporter
      (clear ?to)       ;; destination peg must be clear (no disk on top)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)        ;; supporter becomes clear (no disk on top)
      (not (clear ?to))    ;; destination peg now has a disk on top

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk ?d from supporter ?from (peg or disk) onto top disk ?to (which must be larger).
  ;; Advances stage token from ?s to its successor ?s2.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; ?d is the top disk on its supporter
      (clear ?to)        ;; ?to must be top on its supporter to receive ?d
      (smaller ?d ?to)   ;; size ordering: ?d strictly smaller than ?to
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)       ;; supporter becomes clear (no disk on top)
      (not (clear ?to))   ;; receiver ?to now has ?d on top, so ?to is not clear

      (not (current ?s))
      (current ?s2)
    )
  )
)