(define (domain hanoi2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    thing
    peg - thing
    disk - thing
    agent
  )

  (:predicates
    (on ?d - disk ?x - thing)      ; disk on a peg or another disk
    (clear ?x - thing)             ; no disk on thing (peg or disk)
    (larger ?x - disk ?y - disk)   ; x strictly larger than y

    ; Agent permissions (static)
    (allowed-a1 ?d - disk)
    (allowed-a2 ?d - disk)
  )

  ; Agent 1 moves (allowed only for disks A..E)

  (:action move_a1_to_peg
    :parameters (?d - disk ?from - thing ?to - peg)
    :precondition (and
      (allowed-a1 ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_a1_to_disk
    :parameters (?d - disk ?from - thing ?to - disk)
    :precondition (and
      (allowed-a1 ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ; Agent 2 moves (allowed only for disks F..J)

  (:action move_a2_to_peg
    :parameters (?d - disk ?from - thing ?to - peg)
    :precondition (and
      (allowed-a2 ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move_a2_to_disk
    :parameters (?d - disk ?from - thing ?to - disk)
    :precondition (and
      (allowed-a2 ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (clear ?d)
    )
  )
)