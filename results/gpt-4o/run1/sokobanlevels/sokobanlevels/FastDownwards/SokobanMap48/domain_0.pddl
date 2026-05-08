(define (domain sokoban)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    position entity
  )

  (:predicates
    (at ?e - entity ?p - position)
    (goal ?p - position)
    (clear ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:constants
    player - entity
    box - entity
    pos_00 pos_01 pos_02 pos_03 pos_04 pos_05 pos_06 pos_07 pos_08 pos_09
    pos_010 pos_011 pos_012 pos_013 pos_014 pos_015 pos_016 pos_017 pos_018 pos_019
    pos_020 pos_021 pos_022 pos_023 pos_024 pos_025 pos_026 pos_027 pos_028 pos_029
    pos_030 pos_031 pos_032 pos_033 pos_034 pos_035 pos_036 pos_037 pos_038 pos_039
    pos_040 pos_041 pos_042 pos_043 pos_044 pos_045 pos_046 pos_047 pos_048 pos_049
    pos_050 pos_051 pos_052 pos_053 pos_054 pos_055 pos_056 pos_057 pos_058 pos_059
    pos_060 pos_061 pos_062 pos_063 pos_064 pos_065 pos_066 pos_067 pos_068 pos_069
    pos_070 pos_071 pos_072 pos_073 pos_074 pos_075 pos_076 pos_077 pos_078 pos_079
    pos_080 pos_081 pos_082 pos_083 pos_084 pos_085 pos_086 pos_087 pos_088 pos_089
    pos_090 pos_091 pos_092 pos_093 pos_094 pos_095 pos_096 pos_097 pos_098 pos_099
  )

  (:action move
    :parameters (?from ?to - position)
    :precondition (and (at player ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push
    :parameters (?box_pos ?player_pos ?new_box_pos - position)
    :precondition (and (at player ?player_pos) (at box ?box_pos) (clear ?new_box_pos) 
                       (adjacent ?player_pos ?box_pos) (adjacent ?box_pos ?new_box_pos))
    :effect (and (not (at box ?box_pos)) (at box ?new_box_pos) 
                 (not (at player ?player_pos)) (at player ?box_pos)
                 (clear ?box_pos) (not (clear ?new_box_pos)))
  )
)