(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent stage)

  (:predicates
    ;; agent marker
    (is-agent ?a - agent)

    ;; disk placement: bottom disk of a peg, and stacked-on relation
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)

    ;; top/clear and peg emptiness
    (clear ?d - disk)     ; there is no disk on top of ?d
    (empty ?p - peg)      ; the peg currently has no disks

    ;; static size ordering (irreflexive partial order)
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stages and successor relation
    (at-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; move a top disk that is the bottom disk of a peg onto an empty peg
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

      ;; update peg emptiness
      (not (empty ?to))
      (empty ?from)

      ;; stage progression (enforce contiguous discrete time)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; move a top disk that is the bottom disk of a peg onto another top disk (destination disk must be larger)
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

      ;; moved disk is top on its new stack
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; move a top disk that is on top of another disk onto an empty peg
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

      ;; moved disk is top on its new stack
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; move a top disk that is on top of another disk onto another top disk (destination must be larger)
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

      ;; moved disk is top on its new stack
      (clear ?d)

      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)