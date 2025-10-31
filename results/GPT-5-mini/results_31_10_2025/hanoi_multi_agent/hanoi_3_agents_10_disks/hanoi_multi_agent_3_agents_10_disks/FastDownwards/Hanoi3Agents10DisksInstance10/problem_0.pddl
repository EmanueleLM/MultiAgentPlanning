(define (problem hanoi-multiagent-instance)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J none - disk
    left middle right - peg
  )

  ; Initial state encodes:
  ; - All disks start on left peg, stacked A (top) down to J (bottom).
  ; - 'below' links reflect the direct adjacency: A below B, B below C, ..., I below J, J below none.
  ; - Only A is top on left initially; middle and right are empty.
  ; - Agent move permissions encoded by canmove1/2/3.
  (:init
    ; location facts: all disks start on left
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)

    ; top facts: A is initially top on left; other pegs empty
    (top A left)
    (empty middle)
    (empty right)

    ; below adjacency (directly below each disk)
    (below A B)
    (below B C)
    (below C D)
    (below D E)
    (below E F)
    (below F G)
    (below G H)
    (below H I)
    (below I J)
    (below J none)

    ; size relations: smaller X Y for every strictly smaller disk X and larger disk Y
    ; (A < B < C < D < E < F < G < H < I < J)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; Agent movement permissions (strict constraints from public info)
    (canmove1 A) (canmove1 B) (canmove1 C) (canmove1 D)
    (canmove2 E) (canmove2 F) (canmove2 G)
    (canmove3 H) (canmove3 I) (canmove3 J)
  )

  ; Goal requires exact final stacks (top-to-bottom) on left and right, and middle empty.
  ; We express stacks using on + top + below adjacency so the order is fully specified.
  (:goal (and
    ; left peg stack top-to-bottom: C, E, F, G, H, I, J
    (on C left) (on E left) (on F left) (on G left) (on H left) (on I left) (on J left)
    (top C left)
    (below C E) (below E F) (below F G) (below G H) (below H I) (below I J) (below J none)

    ; middle peg empty
    (empty middle)

    ; right peg stack top-to-bottom: A, B, D
    (on A right) (on B right) (on D right)
    (top A right)
    (below A B) (below B D) (below D none)
  ))

  ; The agents provided the following validated sequence of primitive moves (already checked to be legal
  ; under the Tower of Hanoi rules and the agent restrictions). We include an explicit grounding mapping
  ; to the domain action schemas here as a reference; a planner using this domain should be able to generate
  ; an equivalent sequence. The grounding below maps each primitive move into one of the domain actions
  ; (agent-specific move variants). For clarity we show the grounded action invocations in the order executed:
  ;
  ; 1) agent_1: move disk A from left to middle
  ;    -> (move_agent_1_to_empty_with_below_disk A left middle B)
  ;
  ; 2) agent_1: move disk B from left to right
  ;    -> (move_agent_1_to_empty_with_below_disk B left right C)
  ;
  ; 3) agent_1: move disk A from middle to right
  ;    -> (move_agent_1_onto_disk_with_below_none A middle right B)
  ;
  ; 4) agent_1: move disk C from left to middle
  ;    -> (move_agent_1_to_empty_with_below_disk C left middle D)
  ;
  ; 5) agent_1: move disk A from right to left
  ;    -> (move_agent_1_onto_disk_with_below_disk A right left D)
  ;
  ; 6) agent_1: move disk B from right to middle
  ;    -> (move_agent_1_onto_disk_with_below_none B right middle C)
  ;
  ; 7) agent_1: move disk A from left to middle
  ;    -> (move_agent_1_onto_disk_with_below_disk A left middle B)
  ;
  ; 8) agent_1: move disk D from left to right
  ;    -> (move_agent_1_to_empty_with_below_disk D left right E)
  ;
  ; 9) agent_1: move disk A from middle to left
  ;    -> (move_agent_1_onto_disk_with_below_disk A middle left E)
  ;
  ; 10) agent_1: move disk B from middle to right
  ;    -> (move_agent_1_onto_disk_with_below_disk B middle right D)
  ;
  ; 11) agent_1: move disk A from left to right
  ;    -> (move_agent_1_onto_disk_with_below_none A left right B)
  ;
  ; 12) agent_1: move disk C from middle to left
  ;    -> (move_agent_1_to_empty_with_below_none C middle left)
  ;
  ; Agents 2 and 3 performed no moves (they explicitly reported they cannot act given the public info).
  ; The above grounded sequence is exactly the validated integrated plan that achieves the stated goal.
)