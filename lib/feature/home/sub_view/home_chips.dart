// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_view.dart';

class _PassiveChip extends StatelessWidget {
  const _PassiveChip( this.tag) ;
  final Tag tag;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tag.name??'',
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorConstants.grey,
        ),
      ),
      backgroundColor: ColorConstants.greyLighter,
      padding: context.paddingLow,
    );
  }
}

class _ActiveChip extends StatelessWidget {
  const _ActiveChip(this.tag);
  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tag.name??'',
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorConstants.white,
        ),
      ),
      backgroundColor: ColorConstants.purplePrimary,
      padding: context.paddingLow,
    );
  }
}
