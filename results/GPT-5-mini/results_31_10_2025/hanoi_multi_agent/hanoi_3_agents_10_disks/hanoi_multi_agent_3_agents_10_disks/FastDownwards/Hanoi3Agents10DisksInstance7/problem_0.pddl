(define (problem hanoi_instance_10_disks)
  (:domain hanoi_agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ; initial stacking on left (bottom J, then I, H, G, F, E, D, C, B, A top)
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

    ; initially A is top on left
    (top A left)

    ; pegs empty state
    (empty middle)
    (empty right)

    ; initial clear predicates (only A has no disk above)
    (clear A)

    ; agent move permissions (as provided)
    (can_move agent_1 A)
    (can_move agent_1 B)
    ; agent_2 and agent_3 have no can_move facts (they will perform no moves)

    ; larger relations (full linear order J > I > H > G > F > E > D > C > B > A)
    ; J is larger than I..A
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    ; I is larger than H..A
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    ; H larger than G..A
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    ; G larger than F..A
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    ; F larger than E..A
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    ; E larger than D..A
    (larger E D) (larger E C) (larger E B) (larger E A)
    ; D larger than C..A
    (larger D C) (larger D B) (larger D A)
    ; C larger than B and A
    (larger C B) (larger C A)
    ; B larger than A
    (larger B A)
  )

  (:goal (and
    ; public goal: place B on the right peg
    (on-peg B right)

    ; disks H, I, J must be on the left peg in final positions (they already are initially)
    (on-peg J left)
    (on-disk I J)
    (on-disk H I)

    ; The integrated plan produces the final full configuration (consistent with executing the three steps):
    ; left stack final (top -> bottom): A, C, D, E, F, G, H, I, J
    (on-disk A C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    ; (H, I, J already asserted above)

    ; pegs final state: middle empty again, right has B on top
    (empty middle)
    (top A left)
    (top B right)
  ))
)