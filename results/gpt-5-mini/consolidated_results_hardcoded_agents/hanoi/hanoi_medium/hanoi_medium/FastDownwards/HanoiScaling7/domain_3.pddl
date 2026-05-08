(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:predicates
    ;; classification
    (disk ?x - place)
    (peg ?x - place)

    ;; structural relations: a disk is directly on a place (peg or another disk)
    (on ?d - place ?p - place)

    ;; a place (peg or disk) has nothing directly on it (is top / empty)
    (clear ?p - place)

    ;; static size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - place ?d2 - place)

    ;; explicit discrete stage progression (static)
    (next ?s - step ?s2 - step)
    (at-step ?s - step)
  )

  ;; Move the top disk from its current supporting place onto an empty peg,
  ;; advancing the global stage to the immediate successor.
  (:action move-to-peg
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; ?d is top of its stack
      (clear ?to)          ;; destination peg is empty (top)
      (next ?s ?s2)        ;; must advance to immediate successor stage
      (at-step ?s)
      (not (= ?from ?to))  ;; disallow no-op moves
      (not (= ?d ?to))
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear markers: destination no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance the global stage atomically
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move the top disk from its current supporting place onto another top disk
  ;; (only allowed if the moving disk is smaller than the destination disk),
  ;; advancing the global stage to the immediate successor.
  (:action move-to-disk
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; ?d is top of its stack
      (clear ?to)          ;; destination disk is top of its stack
      (smaller ?d ?to)     ;; size constraint
      (next ?s ?s2)
      (at-step ?s)
      (not (= ?from ?to))  ;; prevent ill-formed/self moves
      (not (= ?d ?to))
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear markers
      (not (clear ?to))
      (clear ?from)

      ;; advance the global stage atomically
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)