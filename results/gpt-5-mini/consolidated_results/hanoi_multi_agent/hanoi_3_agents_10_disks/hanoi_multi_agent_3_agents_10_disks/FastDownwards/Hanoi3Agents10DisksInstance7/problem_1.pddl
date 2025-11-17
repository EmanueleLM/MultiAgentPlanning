(define (problem hanoi_instance_10_disks)
  (:domain hanoi_agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; initial stacking on left (bottom J, then I, H, G, F, E, D, C, B, A top)
    (on-peg J left)
    (on-disk I J)
    (on-disk H I)
    (on-disk G H)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; top facts
    (top A left)

    ;; pegs empty state
    (empty middle)
    (empty right)

    ;; clear predicates (only A initially has no disk above)
    (clear A)

    ;; agent move permissions
    (can_move agent_1 A)
    (can_move agent_1 B)
    (can_move agent_1 C)
    (can_move agent_1 D)
    (can_move agent_2 E)
    (can_move agent_2 F)
    (can_move agent_2 G)
    (can_move agent_3 H)
    (can_move agent_3 I)
    (can_move agent_3 J)

    ;; larger relations: linear order J > I > H > G > F > E > D > C > B > A
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)
  )

  (:goal (and
    ;; public goal: B on the right peg
    (on-peg B right)

    ;; final left stack (top -> bottom): A, C, D, E, F, G, H, I, J
    (on-disk A C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)

    ;; disks H, I, J remain in their relative positions (bottommost part of left)
    (on-peg J left)
    (on-disk I J)
    (on-disk H I)

    ;; pegs final state: middle empty again, top facts
    (empty middle)
    (top A left)
    (top B right)
  ))
)