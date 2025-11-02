(define (domain hanoi-3agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types support disk peg) ; disk and peg are subtypes of support
  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is immediately on support ?s (disk or peg or EMPTY)
    (top ?p - peg ?s - support)       ; top of peg ?p is support ?s (a disk or EMPTY)
    (agent1-disk ?d - disk)
    (agent2-disk ?d - disk)
    (agent3-disk ?d - disk)
    (smaller ?d - disk ?s - support)  ; ?d is strictly smaller than support ?s (disk or EMPTY)
  )

  ; ============================
  ; Actions for agent_1 (disks A,B,C,D)
  ; Two variants per agent: when the disk's support below is a disk, and when it's a peg.
  ; These actions require the moved disk to be the top of the source peg, and the target peg's top support
  ; to be larger (smaller ?d ?t).
  ; ============================
  (:action move-agent1-on-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - support)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?t)
    )
  )

  (:action move-agent1-on-peg
    :parameters (?d - disk ?from - peg ?to - peg ?below - peg ?t - support)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from EMPTY)
      (not (top ?to ?t))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?t)
    )
  )

  ; ============================
  ; Actions for agent_2 (disks E,F,G)
  ; ============================
  (:action move-agent2-on-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - support)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?t)
    )
  )

  (:action move-agent2-on-peg
    :parameters (?d - disk ?from - peg ?to - peg ?below - peg ?t - support)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from EMPTY)
      (not (top ?to ?t))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?t)
    )
  )

  ; ============================
  ; Actions for agent_3 (disks H,I,J)
  ; ============================
  (:action move-agent3-on-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - support)
    :precondition (and
      (agent3-disk ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?t)
    )
  )

  (:action move-agent3-on-peg
    :parameters (?d - disk ?from - peg ?to - peg ?below - peg ?t - support)
    :precondition (and
      (agent3-disk ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from EMPTY)
      (not (top ?to ?t))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?t)
    )
  )

)