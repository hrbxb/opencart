<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-error"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-list"></i><?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="btn"><i class="icon-plus"></i><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="btn"><i class="icon-trash"></i><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td width="1" style="align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'title') { ?>
                <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'unit') { ?>
                <a href="<?php echo $sort_unit; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_unit; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_unit; ?>"><?php echo $column_unit; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($measurement_classes) { ?>
            <?php foreach ($measurement_classes as $measurement_class) { ?>
            <tr>
              <td style="align: center;"><?php if ($measurement_class['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $measurement_class['measurement_class_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $measurement_class['measurement_class_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $measurement_class['title']; ?></td>
              <td class="left"><?php echo $measurement_class['unit']; ?></td>
              <td class="right"><?php foreach ($measurement_class['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
      <div class="results"><?php echo $results; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>