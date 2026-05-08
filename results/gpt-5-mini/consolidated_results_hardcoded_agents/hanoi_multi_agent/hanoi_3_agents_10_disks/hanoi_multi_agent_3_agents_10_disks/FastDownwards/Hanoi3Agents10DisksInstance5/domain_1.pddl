(define (domain hanoi-3agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-disk ?d - disk ?under - disk)    ; ?d is directly on top of disk ?under
    (on-peg  ?d - disk ?p - peg)         ; ?d is directly on peg ?p
    (clear-disk ?d - disk)               ; no disk is on ?d (i.e., ?d is top of its stack)
    (clear-peg ?p - peg)                 ; peg ?p has no disks (is empty)
    (smaller ?d1 - disk ?d2 - disk)      ; d1 is smaller than d2
    (can-move ?a - agent ?d - disk)      ; agent ?a is allowed to move disk ?d
  )

  ;-------------------------
  ; Actions for agent_1
  ;-------------------------
  (:action move-agent_1-from-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
                    (can-move agent_1 ?d)
                    (on-disk ?d ?below)
                    (clear-disk ?d)
                    (clear-peg ?to))
    :effect (and
              (not (on-disk ?d ?below))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-disk ?below))
  )

  (:action move-agent_1-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk)
    :precondition (and
                    (can-move agent_1 ?d)
                    (on-disk ?d ?below)
                    (clear-disk ?d)
                    (clear-disk ?t)
                    (smaller ?d ?t))
    :effect (and
              (not (on-disk ?d ?below))
              (on-disk ?d ?t)
              (not (clear-disk ?t))
              (clear-disk ?below))
  )

  (:action move-agent_1-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (can-move agent_1 ?d)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to))
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to)))
  )

  (:action move-agent_1-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk)
    :precondition (and
                    (can-move agent_1 ?d)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?t)
                    (smaller ?d ?t))
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?t)
              (clear-peg ?from)
              (not (clear-disk ?t)))
  )

  ;-------------------------
  ; Actions for agent_2
  ;-------------------------
  (:action move-agent_2-from-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
                    (can-move agent_2 ?d)
                    (on-disk ?d ?below)
                    (clear-disk ?d)
                    (clear-peg ?to))
    :effect (and
              (not (on-disk ?d ?below))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-disk ?below))
  )

  (:action move-agent_2-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk)
    :precondition (and
                    (can-move agent_2 ?d)
                    (on-disk ?d ?below)
                    (clear-disk ?d)
                    (clear-disk ?t)
                    (smaller ?d ?t))
    :effect (and
              (not (on-disk ?d ?below))
              (on-disk ?d ?t)
              (not (clear-disk ?t))
              (clear-disk ?below))
  )

  (:action move-agent_2-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (can-move agent_2 ?d)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to))
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to)))
  )

  (:action move-agent_2-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk)
    :precondition (and
                    (can-move agent_2 ?d)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?t)
                    (smaller ?d ?t))
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?t)
              (clear-peg ?from)
              (not (clear-disk ?t)))
  )

  ;-------------------------
  ; Actions for agent_3
  ;-------------------------
  (:action move-agent_3-from-disk-to-empty-peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
                    (can-move agent_3 ?d)
                    (on-disk ?d ?below)
                    (clear-disk ?d)
                    (clear-peg ?to))
    :effect (and
              (not (on-disk ?d ?below))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-disk ?below))
  )

  (:action move-agent_3-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk)
    :precondition (and
                    (can-move agent_3 ?d)
                    (on-disk ?d ?below)
                    (clear-disk ?d)
                    (clear-disk ?t)
                    (smaller ?d ?t))
    :effect (and
              (not (on-disk ?d ?below))
              (on-disk ?d ?t)
              (not (clear-disk ?t))
              (clear-disk ?below))
  )

  (:action move-agent_3-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (can-move agent_3 ?d)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to))
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to)))
  )

  (:action move-agent_3-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk)
    :precondition (and
                    (can-move agent_3 ?d)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?t)
                    (smaller ?d ?t))
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?t)
              (clear-peg ?from)
              (not (clear-disk ?t)))
  )
)