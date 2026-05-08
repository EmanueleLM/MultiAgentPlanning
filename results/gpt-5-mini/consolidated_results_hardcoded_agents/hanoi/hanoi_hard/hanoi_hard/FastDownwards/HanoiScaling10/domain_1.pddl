(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
    stage
  )

  (:predicates
    ;; immediate support relation (disk is immediately on place)
    (on ?d - disk ?p - place)
    ;; no disk on top of place (peg or disk)
    (clear ?p - place)
    ;; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage successor relation (static)
    (succ ?s1 - stage ?s2 - stage)
    ;; the current global stage (exactly one should hold at any time)
    (current ?s - stage)
  )

  ;; Move a top disk ?d from supporter ?from (peg or disk) onto an empty peg ?to.
  ;; This action advances the global stage from ?s to its successor ?s2,
  ;; enforcing single-action-at-a-time and strict stage ordering.
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; update support
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear statuses for affected places
      (clear ?from)
      (not (clear ?to))

      ;; advance stage token (serializes actions)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk ?d from supporter ?from onto a top disk ?to (which must be larger).
  ;; Also advances the global stage token.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; update support
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear statuses for affected places
      (clear ?from)
      (not (clear ?to))

      ;; advance stage token (serializes actions)
      (not (current ?s))
      (current ?s2)
    )
  )
)