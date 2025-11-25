(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent stage)

  (:predicates
    (is-agent ?a - agent)

    (on-peg ?d - disk ?p - peg)    ; disk is the bottom disk on peg
    (on-disk ?d - disk ?under - disk) ; disk is directly on another disk

    (clear ?d - disk)             ; nothing on top of this disk
    (empty ?p - peg)              ; peg has no disks

    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2

    (at-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Move top disk when it is the single disk on a peg -> move to an empty peg
  (:action move-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (empty ?to))
      (empty ?from)

      ;; moved disk remains clear (top of its peg)
      (clear ?d)

      ;; stage progression (contiguous discrete time)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move top disk that is the single disk on a peg onto a (clear) disk (destination disk must be larger)
  (:action move-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk no longer clear
      (not (clear ?to))

      ;; source peg becomes empty
      (empty ?from)

      ;; moved disk is top on its new stack
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move top disk that is on top of another disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?ag - agent ?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; the disk below becomes clear (nothing on it)
      (clear ?below)

      ;; destination peg now has a bottom disk
      (not (empty ?to))

      ;; moved disk is top on its new stack
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move top disk that is on top of another disk onto another (clear) disk (destination must be larger)
  (:action move-disk-to-disk
    :parameters (?ag - agent ?d - disk ?below - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      ;; the disk below becomes clear
      (clear ?below)

      ;; destination disk no longer clear
      (not (clear ?to))

      ;; moved disk is top on its new stack
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)