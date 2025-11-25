(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent stage)

  (:predicates
    (is-agent ?a - agent)
    (on-peg ?d - disk ?p - peg)       ; disk ?d is directly on peg ?p (i.e., the bottom disk of that peg's stack if others are stacked on it)
    (on-disk ?d - disk ?under - disk) ; disk ?d is directly on top of disk ?under
    (clear ?d - disk)                 ; there is no disk on top of ?d (it is top of its stack)
    (empty ?p - peg)                  ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is strictly smaller than d2
    (at-stage ?s - stage)             ; current stage/time is ?s
    (next ?s - stage ?s2 - stage)     ; ordering of stages (successor relation)
  )

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
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

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
      (not (clear ?to))
      (empty ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

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
      (clear ?below)
      (not (empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

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
      (clear ?below)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)