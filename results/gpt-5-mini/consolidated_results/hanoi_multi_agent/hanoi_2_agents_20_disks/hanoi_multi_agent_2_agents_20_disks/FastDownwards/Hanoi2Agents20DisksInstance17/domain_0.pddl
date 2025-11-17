(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg)

  (:predicates
    (on ?d - disk ?s - object)        ; disk ?d is directly on object ?s (disk or peg)
    (clear ?d - disk)                ; no disk on top of ?d
    (clear-peg ?p - peg)             ; peg ?p has no disk directly on it
    (smaller ?a - disk ?b - disk)    ; ?a is smaller than ?b
  )

  ;; Agent 1 actions
  (:action agent_1_move_from_peg_to_empty
    :parameters (?d - disk ?s - peg ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (clear-peg ?to) (not (= ?s ?to)))
    :effect (and
      (not (on ?d ?s))
      (not (clear-peg ?to))
      (on ?d ?to)
      (clear ?d)
      (clear-peg ?s)
    )
  )

  (:action agent_1_move_from_peg_to_disk
    :parameters (?d - disk ?s - peg ?td - disk ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (on ?td ?to) (clear ?td) (smaller ?d ?td) (not (= ?s ?to)))
    :effect (and
      (not (on ?d ?s))
      (not (clear ?td))
      (on ?d ?td)
      (clear ?d)
      (clear-peg ?s)
    )
  )

  (:action agent_1_move_from_disk_to_empty
    :parameters (?d - disk ?s - disk ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (clear-peg ?to) (not (= ?s ?to)))
    :effect (and
      (not (on ?d ?s))
      (not (clear-peg ?to))
      (on ?d ?to)
      (clear ?d)
      (clear ?s)
    )
  )

  (:action agent_1_move_from_disk_to_disk
    :parameters (?d - disk ?s - disk ?td - disk ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (on ?td ?to) (clear ?td) (smaller ?d ?td))
    :effect (and
      (not (on ?d ?s))
      (not (clear ?td))
      (on ?d ?td)
      (clear ?d)
      (clear ?s)
    )
  )

  ;; Agent 2 actions (defined, but agent_2 performs no moves in the provided integrated plan)
  (:action agent_2_move_from_peg_to_empty
    :parameters (?d - disk ?s - peg ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (clear-peg ?to) (not (= ?s ?to)))
    :effect (and
      (not (on ?d ?s))
      (not (clear-peg ?to))
      (on ?d ?to)
      (clear ?d)
      (clear-peg ?s)
    )
  )

  (:action agent_2_move_from_peg_to_disk
    :parameters (?d - disk ?s - peg ?td - disk ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (on ?td ?to) (clear ?td) (smaller ?d ?td) (not (= ?s ?to)))
    :effect (and
      (not (on ?d ?s))
      (not (clear ?td))
      (on ?d ?td)
      (clear ?d)
      (clear-peg ?s)
    )
  )

  (:action agent_2_move_from_disk_to_empty
    :parameters (?d - disk ?s - disk ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (clear-peg ?to) (not (= ?s ?to)))
    :effect (and
      (not (on ?d ?s))
      (not (clear-peg ?to))
      (on ?d ?to)
      (clear ?d)
      (clear ?s)
    )
  )

  (:action agent_2_move_from_disk_to_disk
    :parameters (?d - disk ?s - disk ?td - disk ?to - peg)
    :precondition (and (on ?d ?s) (clear ?d) (on ?td ?to) (clear ?td) (smaller ?d ?td))
    :effect (and
      (not (on ?d ?s))
      (not (clear ?td))
      (on ?d ?td)
      (clear ?d)
      (clear ?s)
    )
  )

)