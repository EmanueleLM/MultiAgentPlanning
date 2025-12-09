(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; disk d is directly on place p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing directly on it
    (clear ?p - place)
    ;; static size ordering: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
    ;; discrete stage progression
    (next ?s - stage ?s2 - stage)
    ;; marker of current stage (exactly one stage atom will hold at any time)
    (at-stage ?s - stage)
  )

  ;; Move a top disk onto an empty peg (destination is a peg and currently clear).
  ;; This action consumes one stage and produces the next stage deterministically.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (at-stage ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; move disk
              (not (on ?d ?from))
              (on ?d ?to)
              ;; update clear flags
              (not (clear ?to))
              (clear ?from)
              ;; advance stage marker
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  ;; Move a top disk onto another disk (destination is a disk which must be clear and larger).
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?t)
                    (smaller ?d ?t)
                    (at-stage ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; move disk onto disk ?t
              (not (on ?d ?from))
              (on ?d ?t)
              ;; update clear flags
              (not (clear ?t))
              (clear ?from)
              ;; advance stage marker
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )
)