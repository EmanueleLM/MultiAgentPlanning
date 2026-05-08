(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent stage)

  (:predicates
    ;; agent marker (avoid name clash with type)
    (is-agent ?a - agent)

    ;; disk placement predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)

    ;; top/clear and peg emptiness
    (clear ?d - disk)     ; there is no disk on top of ?d (i.e., it is top of its stack)
    (empty ?p - peg)      ; the peg currently has no disks

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stages and their successor relation
    (at-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; move a top disk from an empty peg to another empty peg (peg->peg)
  (:action move-from-peg-to-peg
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
      ;; relocate the disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg emptiness updates
      (not (empty ?to))
      (empty ?from)

      ;; stage progression (enforces contiguous discrete time)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; move a top disk from a peg onto a top disk (peg->disk); destination disk must be larger
  (:action move-from-peg-to-disk
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
      ;; relocate the disk onto the destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; the destination disk is no longer clear; the source peg becomes empty
      (not (clear ?to))
      (empty ?from)

      ;; the moved disk remains clear (top of its new stack)
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; move a top disk from on top of a disk onto an empty peg (disk->peg)
  (:action move-from-disk-to-peg
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
      ;; relocate the disk to the peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; the disk below becomes clear (nothing on it anymore)
      (clear ?below)

      ;; the destination peg is no longer empty
      (not (empty ?to))

      ;; moved disk remains clear (top of its new stack)
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; move a top disk from on top of a disk onto another top disk (disk->disk); destination must be larger
  (:action move-from-disk-to-disk
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
      ;; relocate the disk onto the destination disk
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      ;; the disk below becomes clear (nothing on it anymore)
      (clear ?below)

      ;; the destination disk is no longer clear
      (not (clear ?to))

      ;; moved disk remains clear (top of its new stack)
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)