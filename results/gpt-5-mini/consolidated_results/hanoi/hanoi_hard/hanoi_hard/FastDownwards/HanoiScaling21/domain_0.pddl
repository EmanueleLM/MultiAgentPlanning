(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place
  )
  (:predicates
    ;; a disk is located directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; static ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Mover agent 1 actions (attributable to mover1)
  (:action mover1-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action mover1-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Mover agent 2 actions (attributable to mover2)
  (:action mover2-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action mover2-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)