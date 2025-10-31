(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  ;; types: all movable disks are subtypes of disk.
  ;; peg bases are represented as special disks (peg_base) that are larger than all real disks.
  (:types disk_a_e disk_f_j disk_k_o peg_base - disk)

  (:predicates
    ;; disk ?d is directly on support ?s (both are declared as disk objects; peg bases are special disks)
    (on ?d - disk ?s - disk)
    ;; no disk on top of ?d
    (clear ?d - disk)
    ;; static size relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1: may move disks A-E
  (:action move_agent_1
    :parameters (?d - disk_a_e ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: may move disks F-J
  (:action move_agent_2
    :parameters (?d - disk_f_j ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 3: may move disks K-O
  (:action move_agent_3
    :parameters (?d - disk_k_o ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)