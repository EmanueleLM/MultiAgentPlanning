(define (domain hanoi-coop)
  (:requirements :strips :typing)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?p - disk)
    (on-peg  ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 actions: may move disks a b c d e only
  ;; For each disk we provide four move variants depending on source/target being disk or peg.

  ;; Moves for disk a (agent_1)
  (:action move-agent1-a-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk a ?from) (clear-disk a) (clear-disk ?to) (smaller a ?to))
    :effect (and (not (on-disk a ?from)) (on-disk a ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )

  (:action move-agent1-a-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk a ?from) (clear-disk a) (clear-peg ?to))
    :effect (and (not (on-disk a ?from)) (on-peg a ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )

  (:action move-agent1-a-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg a ?from) (clear-disk a) (clear-disk ?to) (smaller a ?to))
    :effect (and (not (on-peg a ?from)) (on-disk a ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )

  (:action move-agent1-a-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg a ?from) (clear-disk a) (clear-peg ?to))
    :effect (and (not (on-peg a ?from)) (on-peg a ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk b (agent_1)
  (:action move-agent1-b-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk b ?from) (clear-disk b) (clear-disk ?to) (smaller b ?to))
    :effect (and (not (on-disk b ?from)) (on-disk b ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-b-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk b ?from) (clear-disk b) (clear-peg ?to))
    :effect (and (not (on-disk b ?from)) (on-peg b ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent1-b-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg b ?from) (clear-disk b) (clear-disk ?to) (smaller b ?to))
    :effect (and (not (on-peg b ?from)) (on-disk b ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-b-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg b ?from) (clear-disk b) (clear-peg ?to))
    :effect (and (not (on-peg b ?from)) (on-peg b ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk c (agent_1)
  (:action move-agent1-c-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk c ?from) (clear-disk c) (clear-disk ?to) (smaller c ?to))
    :effect (and (not (on-disk c ?from)) (on-disk c ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-c-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk c ?from) (clear-disk c) (clear-peg ?to))
    :effect (and (not (on-disk c ?from)) (on-peg c ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent1-c-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg c ?from) (clear-disk c) (clear-disk ?to) (smaller c ?to))
    :effect (and (not (on-peg c ?from)) (on-disk c ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-c-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg c ?from) (clear-disk c) (clear-peg ?to))
    :effect (and (not (on-peg c ?from)) (on-peg c ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk d (agent_1)
  (:action move-agent1-d-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk d ?from) (clear-disk d) (clear-disk ?to) (smaller d ?to))
    :effect (and (not (on-disk d ?from)) (on-disk d ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-d-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk d ?from) (clear-disk d) (clear-peg ?to))
    :effect (and (not (on-disk d ?from)) (on-peg d ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent1-d-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg d ?from) (clear-disk d) (clear-disk ?to) (smaller d ?to))
    :effect (and (not (on-peg d ?from)) (on-disk d ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-d-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg d ?from) (clear-disk d) (clear-peg ?to))
    :effect (and (not (on-peg d ?from)) (on-peg d ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk e (agent_1)
  (:action move-agent1-e-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk e ?from) (clear-disk e) (clear-disk ?to) (smaller e ?to))
    :effect (and (not (on-disk e ?from)) (on-disk e ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-e-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk e ?from) (clear-disk e) (clear-peg ?to))
    :effect (and (not (on-disk e ?from)) (on-peg e ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent1-e-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg e ?from) (clear-disk e) (clear-disk ?to) (smaller e ?to))
    :effect (and (not (on-peg e ?from)) (on-disk e ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent1-e-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg e ?from) (clear-disk e) (clear-peg ?to))
    :effect (and (not (on-peg e ?from)) (on-peg e ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Agent 2 actions: may move disks f g h i j only

  ;; Moves for disk f (agent_2)
  (:action move-agent2-f-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk f ?from) (clear-disk f) (clear-disk ?to) (smaller f ?to))
    :effect (and (not (on-disk f ?from)) (on-disk f ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-f-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk f ?from) (clear-disk f) (clear-peg ?to))
    :effect (and (not (on-disk f ?from)) (on-peg f ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent2-f-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg f ?from) (clear-disk f) (clear-disk ?to) (smaller f ?to))
    :effect (and (not (on-peg f ?from)) (on-disk f ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-f-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg f ?from) (clear-disk f) (clear-peg ?to))
    :effect (and (not (on-peg f ?from)) (on-peg f ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk g (agent_2)
  (:action move-agent2-g-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk g ?from) (clear-disk g) (clear-disk ?to) (smaller g ?to))
    :effect (and (not (on-disk g ?from)) (on-disk g ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-g-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk g ?from) (clear-disk g) (clear-peg ?to))
    :effect (and (not (on-disk g ?from)) (on-peg g ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent2-g-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg g ?from) (clear-disk g) (clear-disk ?to) (smaller g ?to))
    :effect (and (not (on-peg g ?from)) (on-disk g ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-g-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg g ?from) (clear-disk g) (clear-peg ?to))
    :effect (and (not (on-peg g ?from)) (on-peg g ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk h (agent_2)
  (:action move-agent2-h-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk h ?from) (clear-disk h) (clear-disk ?to) (smaller h ?to))
    :effect (and (not (on-disk h ?from)) (on-disk h ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-h-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk h ?from) (clear-disk h) (clear-peg ?to))
    :effect (and (not (on-disk h ?from)) (on-peg h ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent2-h-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg h ?from) (clear-disk h) (clear-disk ?to) (smaller h ?to))
    :effect (and (not (on-peg h ?from)) (on-disk h ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-h-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg h ?from) (clear-disk h) (clear-peg ?to))
    :effect (and (not (on-peg h ?from)) (on-peg h ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk i (agent_2)
  (:action move-agent2-i-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk i ?from) (clear-disk i) (clear-disk ?to) (smaller i ?to))
    :effect (and (not (on-disk i ?from)) (on-disk i ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-i-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk i ?from) (clear-disk i) (clear-peg ?to))
    :effect (and (not (on-disk i ?from)) (on-peg i ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent2-i-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg i ?from) (clear-disk i) (clear-disk ?to) (smaller i ?to))
    :effect (and (not (on-peg i ?from)) (on-disk i ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-i-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg i ?from) (clear-disk i) (clear-peg ?to))
    :effect (and (not (on-peg i ?from)) (on-peg i ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

  ;; Moves for disk j (agent_2)
  (:action move-agent2-j-disk-to-disk
    :parameters (?from - disk ?to - disk)
    :precondition (and (on-disk j ?from) (clear-disk j) (clear-disk ?to) (smaller j ?to))
    :effect (and (not (on-disk j ?from)) (on-disk j ?to) (clear-disk ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-j-disk-to-peg
    :parameters (?from - disk ?to - peg)
    :precondition (and (on-disk j ?from) (clear-disk j) (clear-peg ?to))
    :effect (and (not (on-disk j ?from)) (on-peg j ?to) (clear-disk ?from) (not (clear-peg ?to)))
  )
  (:action move-agent2-j-peg-to-disk
    :parameters (?from - peg ?to - disk)
    :precondition (and (on-peg j ?from) (clear-disk j) (clear-disk ?to) (smaller j ?to))
    :effect (and (not (on-peg j ?from)) (on-disk j ?to) (clear-peg ?from) (not (clear-disk ?to)))
  )
  (:action move-agent2-j-peg-to-peg
    :parameters (?from - peg ?to - peg)
    :precondition (and (on-peg j ?from) (clear-disk j) (clear-peg ?to))
    :effect (and (not (on-peg j ?from)) (on-peg j ?to) (clear-peg ?from) (not (clear-peg ?to)))
  )

)