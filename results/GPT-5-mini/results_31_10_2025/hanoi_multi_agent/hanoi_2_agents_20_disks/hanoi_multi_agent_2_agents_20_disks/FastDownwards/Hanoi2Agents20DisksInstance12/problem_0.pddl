(define (problem hanoi_multi_agent-prob)
  (:domain hanoi_multi_agent)

  ;; Objects: disks A..J are of subtype disk1 (movable by agent_1), K..T are of subtype disk2 (movable by agent_2)
  (:objects
    A B C D E F G H I J - disk1
    K L M N O P Q R S T - disk2
    left middle right - peg
  )

  ;; Initial state:
  ;; All disks A..T start on the left peg (top-to-bottom in the environment info: A, B, C, D, ... T).
  ;; Middle and right are empty.
  (:init
    ;; disk positions
    (at A left) (at B left) (at C left) (at D left) (at E left) (at F left) (at G left) (at H left)
    (at I left) (at J left) (at K left) (at L left) (at M left) (at N left) (at O left) (at P left)
    (at Q left) (at R left) (at S left) (at T left)

    ;; empty pegs
    (empty middle)
    (empty right)

    ;; Note: we do not assert (empty left) because left initially has all disks.
  )

  ;; Goal: Achieve the stated configuration:
  ;; - left peg from top to bottom: D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T  (i.e., disks D..T on left)
  ;; - middle peg: B
  ;; - right peg (top to bottom): A, C
  ;;
  ;; Because PDDL here models only peg membership (not full stack structure),
  ;; we encode the goal as exact disk-to-peg assignments and negative constraints
  ;; to ensure no other disks are on these pegs.
  (:goal
    (and
      ;; required positive placements
      (at D left) (at E left) (at F left) (at G left) (at H left) (at I left) (at J left)
      (at K left) (at L left) (at M left) (at N left) (at O left) (at P left) (at Q left)
      (at R left) (at S left) (at T left)

      (at B middle)

      (at A right) (at C right)

      ;; Ensure A, B, C are not on left (they must be at the specified pegs instead)
      (not (at A left)) (not (at B left)) (not (at C left))

      ;; Ensure no other disks are on middle except B
      (not (at A middle)) (not (at C middle))
      (not (at D middle)) (not (at E middle)) (not (at F middle)) (not (at G middle)) (not (at H middle)) (not (at I middle))
      (not (at J middle)) (not (at K middle)) (not (at L middle)) (not (at M middle)) (not (at N middle))
      (not (at O middle)) (not (at P middle)) (not (at Q middle)) (not (at R middle)) (not (at S middle)) (not (at T middle))

      ;; Ensure no other disks are on right except A and C
      (not (at B right))
      (not (at D right)) (not (at E right)) (not (at F right)) (not (at G right)) (not (at H right)) (not (at I right))
      (not (at J right)) (not (at K right)) (not (at L right)) (not (at M right)) (not (at N right))
      (not (at O right)) (not (at P right)) (not (at Q right)) (not (at R right)) (not (at S right)) (not (at T right))
    )
  )

  ;;; Comments about validation and corrections:
  ;; The orchestrator validated the moves provided by agent_1:
  ;;   1) move A from left to right
  ;;   2) move B from left to middle
  ;;   3) move A from right to middle
  ;;   4) move C from left to right
  ;;   5) move A from middle to right
  ;;
  ;; This sequence is legal under the Tower of Hanoi rules (only one disk moved at a time,
  ;; smaller disks placed on larger disks), and all moved disks (A, B, C) are within agent_1's allowed set (A-J).
  ;; Agent_2 provided no moves; agent_2 is permitted to move disks K-T but is not required here.
  ;;
  ;; No corrections to the agent_1 move sequence were necessary; the plan implemented in the domain
  ;; uses five agent_1 actions (one per primitive move) so that FastDownwards can find the same execution.
  ;; The domain includes a conservative, unused generic move_by_agent_2 action to represent agent_2 capability.
)