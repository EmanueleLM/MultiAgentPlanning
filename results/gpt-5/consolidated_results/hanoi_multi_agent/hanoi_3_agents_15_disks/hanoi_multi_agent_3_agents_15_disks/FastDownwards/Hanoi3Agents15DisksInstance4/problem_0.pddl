(define (problem hanoi_15disks_instance4)
  (:domain hanoi_multiagent)
  (:objects
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
    agent_1 agent_2 agent_3 - agent
  )
  (:init
    ; initial stack: all disks on left (A smallest on top)
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

    ; agent-disk permissions
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

    ; only these disks are allowed to move in this task
    (task-disk A)
    (task-disk B)
    (task-disk C)

    ; start of the mandated sequence
    (enabled agent_1 A left right)

    ; successor links encoding the exact order of moves
    ; 1: agent_1 moves A from left to right -> 2
    (succ agent_1 A left right agent_1 B left middle)
    ; 2: agent_1 moves B from left to middle -> 3
    (succ agent_1 B left middle agent_1 A right middle)
    ; 3: agent_1 moves A from right to middle -> 4
    (succ agent_1 A right middle agent_1 C left right)
    ; 4: agent_1 moves C from left to right -> 5
    (succ agent_1 C left right agent_1 A middle left)
    ; 5: agent_1 moves A from middle to left -> 6
    (succ agent_1 A middle left agent_1 B middle right)
    ; 6: agent_1 moves B from middle to right -> 7
    (succ agent_1 B middle right agent_1 A left middle)
    ; 7: agent_1 moves A from left to middle -> stays at 7 (no further moves)
    (succ agent_1 A left middle agent_1 A left middle)

    ; preconditions for the first move
    (clear-on-peg A left)
    (can-place A right)
  )
  (:goal
    (and
      ; final configuration
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