(define (domain hanoi-3agents-20)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality)
  (:types disk peg object) ; peg and disk are subtypes of object

  ;; Predicates
  ;; on ?d ?x : disk ?d is directly on object ?x (object = disk or peg)
  ;; clear ?x : object ?x has nothing on it (i.e., it is available to receive a disk)
  ;; is-peg/is-disk : unary type predicates to allow runtime tests in preconditions
  ;; larger ?big ?small : disk ?big is strictly larger than disk ?small (size ordering)
  ;; can_move_agent1/2/3 ?d : permission for agents to move given disk
  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (is-peg ?x - object)
    (is-disk ?x - object)
    (larger ?big - disk ?small - disk)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  ;; Action for agent_1 moving an allowed disk
  ;; Precond:
  ;;   - the disk must be on the stated from-object
  ;;   - the disk must have nothing on it (clear ?d)
  ;;   - the destination object must be clear (either an empty peg or a disk that is clear)
  ;;   - if the destination is a disk then it must be larger than the moved disk
  ;;   - the disk must be allowed for agent_1 (can_move_agent1)
  (:action agent_1_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (can_move_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (or
        (is-peg ?to)
        (and (is-disk ?to) (larger ?to ?d))
      )
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Action for agent_2
  (:action agent_2_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (can_move_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (or
        (is-peg ?to)
        (and (is-disk ?to) (larger ?to ?d))
      )
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Action for agent_3
  (:action agent_3_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (can_move_agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (or
        (is-peg ?to)
        (and (is-disk ?to) (larger ?to ?d))
      )
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Notes:
  ;; - We model stacks by (on <disk> <object>) where <object> can be a disk or a peg.
  ;;   The topmost disk on a peg is a disk that is on that peg (or on another disk that is on that peg), and it will be the only disk with (clear <disk>) true.
  ;; - To place a disk on a non-empty peg we pass the current top disk as the :to parameter.
  ;; - Agent-specific actions are distinct and gated by can_move_agentX predicates.
)