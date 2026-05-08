(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    disk - place
    peg  - place
    stage
  )

  (:predicates
    ;; immediate support relation: disk is immediately on place (peg or disk)
    (on ?d - disk ?p - place)
    ;; no disk on top of place (peg or disk)
    (clear ?p - place)
    ;; static size ordering: (smaller ?d1 ?d2) means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage successor relation (static)
    (succ ?s1 - stage ?s2 - stage)
    ;; the current global stage (exactly one holds initially and actions preserve uniqueness)
    (current ?s - stage)
  )

  ;; Move a top disk ?d from supporter ?from (peg or disk) onto an empty peg ?to.
  ;; This action advances the global stage from ?s to its successor ?s2,
  ;; enforcing single-action-at-a-time and strict stage ordering.
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)       ;; ?d is the top disk on ?from
      (clear ?to)      ;; destination peg must be clear (empty on top)
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
      (clear ?d)       ;; ?d is the top disk on ?from
      (clear ?to)      ;; ?to must be the top disk on its supporter (so it can receive ?d)
      (smaller ?d ?to) ;; size ordering: cannot place larger on smaller
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