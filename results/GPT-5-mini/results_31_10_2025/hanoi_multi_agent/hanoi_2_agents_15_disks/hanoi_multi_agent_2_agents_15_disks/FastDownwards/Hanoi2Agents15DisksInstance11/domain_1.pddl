(define (domain cooperative-hanoi-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-disk ?d - disk ?support - disk)     ; ?d is directly on top of ?support
    (on-peg ?d - disk ?p - peg)             ; ?d is directly on peg ?p (bottom-most reference)
    (clear-disk ?d - disk)                  ; ?d has no disk on top
    (clear-peg ?p - peg)                    ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)         ; d1 is strictly smaller than d2
    (agent-can-move ?a - agent ?d - disk)   ; agent is allowed to move disk
  )

  ;; Generic move actions parameterized by agent, disk, source, destination (disk or peg).
  ;; We provide four move schemas covering all source/target combos and enforce agent permissions and Tower rules.

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent-can-move ?a ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (agent-can-move ?a ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (agent-can-move ?a ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (agent-can-move ?a ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )
)