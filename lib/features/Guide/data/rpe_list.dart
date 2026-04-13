import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/Guide/data/rpe_list_item.dart';

List<RpeListItem> rpeList = [
  const RpeListItem(
      rpe: 10.0,
      description: 'Максимальное усилие',
      rir: 0,
      color: Color(0xFFEF4444)),
  const RpeListItem(
      rpe: 9.5, description: 'Очень тяжело', rir: 0, color: Color(0xFFEF4444)),
  const RpeListItem(
      rpe: 9.0, description: 'Тяжело', rir: 1, color: Color(0xFFF97316)),
  const RpeListItem(
      rpe: 8.5, description: 'Тяжеловато', rir: 1, color: Color(0xFFF97316)),
  const RpeListItem(
      rpe: 8.0,
      description: 'Умеренно тяжело',
      rir: 2,
      color: Color(0xFFFBBF24)),
  const RpeListItem(
      rpe: 7.5, description: 'Умеренно', rir: 2, color: Color(0xFFFBBF24)),
  const RpeListItem(
      rpe: 7.0, description: 'Легковато', rir: 3, color: Color(0xFFA3E635)),
  const RpeListItem(
      rpe: 6.5, description: 'Легко', rir: 3, color: Color(0xFFA3E635)),
  const RpeListItem(
      rpe: 6.0, description: 'Очень легко', rir: 4, color: Color(0xFF22C55E)),
  const RpeListItem(
      rpe: 5.5,
      description: 'Предельно легко',
      rir: 4,
      color: Color(0xFF22C55E)),
  const RpeListItem(
      rpe: 5.0,
      description: 'Минимальное усилие',
      rir: 5,
      color: Color(0xFF16A34A)),
];
