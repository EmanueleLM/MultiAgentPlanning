(define (problem Hanoi2Agents15DisksInstance7-problem)
  (:domain hanoi-2agents-15)
  (:objects
    A B C D E F G H I J K L M N O - disk
    baseL baseM baseR - disk
    left middle right - peg
  )

  (:init
    ;; initial top of each peg
    (top left A)
    (top middle baseM)
    (top right baseR)

    ;; initial direct-above relations for the left peg stack (top -> bottom)
    (above A B)
    (above B C)
    (above C D)
    (above D E)
    (above E F)
    (above F G)
    (above G H)
    (above H I)
    (above I J)
    (above J K)
    (above K L)
    (above L M)
    (above M N)
    (above N O)
    (above O baseL)

    ;; middle and right pegs are empty except for their base disks being top
    ;; (no "above" facts needed for baseM/baseR)

    ;; movement permissions for agents
    (can_move_agent1 A) (can_move_agent1 B) (can_move_agent1 C) (can_move_agent1 D)
    (can_move_agent1 E) (can_move_agent1 F) (can_move_agent1 G) (can_move_agent1 H)

    (can_move_agent2 I) (can_move_agent2 J) (can_move_agent2 K) (can_move_agent2 L)
    (can_move_agent2 M) (can_move_agent2 N) (can_move_agent2 O)

    ;; size ordering: larger X Y means X is strictly larger than Y.
    ;; Disks ordered (smallest) A < B < C < ... < O (largest among real disks).
    ;; We enumerate all pairs where the first is larger than the second.
    ;; (B larger than A), (C larger than A,B), ..., (O larger than A..N).
    (larger B A)
    (larger C A) (larger C B)
    (larger D A) (larger D B) (larger D C)
    (larger E A) (larger E B) (larger E C) (larger E D)
    (larger F A) (larger F B) (larger F C) (larger F D) (larger F E)
    (larger G A) (larger G B) (larger G C) (larger G D) (larger G E) (larger G F)
    (larger H A) (larger H B) (larger H C) (larger H D) (larger H E) (larger H F) (larger H G)
    (larger I A) (larger I B) (larger I C) (larger I D) (larger I E) (larger I F) (larger I G) (larger I H)
    (larger J A) (larger J B) (larger J C) (larger J D) (larger J E) (larger J F) (larger J G) (larger J H) (larger J I)
    (larger K A) (larger K B) (larger K C) (larger K D) (larger K E) (larger K F) (larger K G) (larger K H) (larger K I) (larger K J)
    (larger L A) (larger L B) (larger L C) (larger L D) (larger L E) (larger L F) (larger L G) (larger L H) (larger L I) (larger L J) (larger L K)
    (larger M A) (larger M B) (larger M C) (larger M D) (larger M E) (larger M F) (larger M G) (larger M H) (larger M I) (larger M J) (larger M K) (larger M L)
    (larger N A) (larger N B) (larger N C) (larger N D) (larger N E) (larger N F) (larger N G) (larger N H) (larger N I) (larger N J) (larger N K) (larger N L) (larger N M)
    (larger O A) (larger O B) (larger O C) (larger O D) (larger O E) (larger O F) (larger O G) (larger O H) (larger O I) (larger O J) (larger O K) (larger O L) (larger O M) (larger O N)

    ;; base disks are larger than all real disks (so any real disk can be placed on an empty peg whose top is its base)
    (larger baseL A) (larger baseL B) (larger baseL C) (larger baseL D) (larger baseL E) (larger baseL F) (larger baseL G) (larger baseL H) (larger baseL I) (larger baseL J) (larger baseL K) (larger baseL L) (larger baseL M) (larger baseL N) (larger baseL O)
    (larger baseM A) (larger baseM B) (larger baseM C) (larger baseM D) (larger baseM E) (larger baseM F) (larger baseM G) (larger baseM H) (larger baseM I) (larger baseM J) (larger baseM K) (larger baseM L) (larger baseM M) (larger baseM N) (larger baseM O)
    (larger baseR A) (larger baseR B) (larger baseR C) (larger baseR D) (larger baseR E) (larger baseR F) (larger baseR G) (larger baseR H) (larger baseR I) (larger baseR J) (larger baseR K) (larger baseR L) (larger baseR M) (larger baseR N) (larger baseR O)
  )

  (:goal (and
    ;; Goal left peg has (top -> bottom) C D E F G H I J K L M N O
    (top left C)
    (above C D) (above D E) (above E F) (above F G) (above G H) (above H I) (above I J) (above J K) (above K L) (above L M) (above M N) (above N O) (above O baseL)

    ;; Goal middle peg is empty (its top is the base disk)
    (top middle baseM)

    ;; Goal right peg has (top -> bottom) A B
    (top right A)
    (above A B) (above B baseR)
  ))
)