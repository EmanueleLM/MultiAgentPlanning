(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)

  (:predicates
    ;; placement predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on peg
    (on-disk ?d - disk ?s - disk)     ; disk directly on another disk

    ;; peg top/empty bookkeeping
    (top ?p - peg ?d - disk)          ; the top disk on peg ?p is ?d
    (empty ?p - peg)                  ; peg has no disks

    ;; each disk's current peg (root peg of its stack)
    (peg-at ?d - disk ?p - peg)

    ;; size order: smaller ?x ?y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ;; Agent-specific move actions for agent a1
  (:action move-a1-disk-to-empty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?s)
      (top ?from ?d)
      (peg-at ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?to)

      (not (top ?from ?d))
      (top ?from ?s)

      (not (empty ?to))
      (top ?to ?d)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  (:action move-a1-disk-to-nonempty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg ?td - disk)
    :precondition (and
      (on-disk ?d ?s)
      (top ?from ?d)
      (top ?to ?td)
      (smaller ?d ?td)
      (peg-at ?d ?from)
      (peg-at ?td ?to)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?td)

      (not (top ?to ?td))
      (top ?to ?d)

      (not (top ?from ?d))
      (top ?from ?s)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  (:action move-a1-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (peg-at ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (top ?from ?d))
      (empty ?from)

      (not (empty ?to))
      (top ?to ?d)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  (:action move-a1-peg-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?td - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (top ?to ?td)
      (smaller ?d ?td)
      (peg-at ?td ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?td)

      (not (top ?to ?td))
      (top ?to ?d)

      (not (top ?from ?d))
      (empty ?from)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  ;; Agent-specific move actions for agent a2 (distinct schemas)
  (:action move-a2-disk-to-empty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?s)
      (top ?from ?d)
      (peg-at ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?to)

      (not (top ?from ?d))
      (top ?from ?s)

      (not (empty ?to))
      (top ?to ?d)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  (:action move-a2-disk-to-nonempty
    :parameters (?d - disk ?s - disk ?from - peg ?to - peg ?td - disk)
    :precondition (and
      (on-disk ?d ?s)
      (top ?from ?d)
      (top ?to ?td)
      (smaller ?d ?td)
      (peg-at ?d ?from)
      (peg-at ?td ?to)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?td)

      (not (top ?to ?td))
      (top ?to ?d)

      (not (top ?from ?d))
      (top ?from ?s)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  (:action move-a2-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (peg-at ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (top ?from ?d))
      (empty ?from)

      (not (empty ?to))
      (top ?to ?d)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )

  (:action move-a2-peg-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?td - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (top ?to ?td)
      (smaller ?d ?td)
      (peg-at ?td ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?td)

      (not (top ?to ?td))
      (top ?to ?d)

      (not (top ?from ?d))
      (empty ?from)

      (not (peg-at ?d ?from))
      (peg-at ?d ?to)
    )
  )
)