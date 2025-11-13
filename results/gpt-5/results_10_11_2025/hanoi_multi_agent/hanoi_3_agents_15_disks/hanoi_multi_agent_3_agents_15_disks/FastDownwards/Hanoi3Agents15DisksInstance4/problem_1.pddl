(define (problem hanoi_15disks_instance4)
  (:domain hanoi_multiagent)
  (:objects
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
    agent_1 agent_2 agent_3 - agent
  )
  (:init
    ; initial locations: all disks on left
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)
    (on K left)
    (on L left)
    (on M left)
    (on N left)
    (on O left)

    ; agent permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)

    (can-move agent_2 F)
    (can-move agent_2 G)
    (can-move agent_2 H)
    (can-move agent_2 I)
    (can-move agent_2 J)

    (can-move agent_3 K)
    (can-move agent_3 L)
    (can-move agent_3 M)
    (can-move agent_3 N)
    (can-move agent_3 O)

    ; only A, B, C are allowed to move in this task
    (task-disk A)
    (task-disk B)
    (task-disk C)

    ; sequence control: start with moving A from left to right
    (enabled agent_1 A left right)

    ; successor links encoding the exact ordered plan
    ; 1: A L->R -> 2: B L->M
    (succ agent_1 A left right agent_1 B left middle)
    ; 2: B L->M -> 3: A R->M
    (succ agent_1 B left middle agent_1 A right middle)
    ; 3: A R->M -> 4: C L->R
    (succ agent_1 A right middle agent_1 C left right)
    ; 4: C L->R -> 5: A M->L
    (succ agent_1 C left right agent_1 A middle left)
    ; 5: A M->L -> 6: B M->R
    (succ agent_1 A middle left agent_1 B middle right)
    ; 6: B M->R -> 7: A L->M
    (succ agent_1 B middle right agent_1 A left middle)
    ; 7: A L->M -> self (no further required moves)
    (succ agent_1 A left middle agent_1 A left middle)

    ; tokens to enable the first move
    (clear-on-peg A left)
    (can-place A right)
  )
  (:goal
    (and
      ; required final configuration
      (on A middle)
      (on B right)
      (on C right)

      (on D left)
      (on E left)
      (on F left)
      (on G left)
      (on H left)
      (on I left)
      (on J left)
      (on K left)
      (on L left)
      (on M left)
      (on N left)
      (on O left)
    )
  )
)